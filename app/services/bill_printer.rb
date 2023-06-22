# frozen_string_literal: true

require 'caracal'

class BillPrinter
  def initialize(bill)
    @bill = bill
  end

  def print
    filename = "BILL#{@bill.id}#{@bill.order_id}#{@bill.order.user_id}.docx"

    Caracal::Document.save filename do |docx|
      docx_format(docx)
      header(docx, @bill.order.user, @bill.order, filename)
      order_table(docx)
      payment(docx, @bill)
    end
  end

  private

  def docx_format(docx)
    # docx.page_size do
    #   width       15_840       # sets the page width. units in twips.
    #   height      12_240       # sets the page height. units in twips.
    #   orientation :landscape # sets the printer orientation. accepts :portrait and :landscape.
    # end
  end

  def header(docx, customer, order)
    docx.p do
      text "Sir / Madam: #{customer.first_name} #{customer.last_name} - #{order.created_at}", size: 24, bold: true
    end
  end

  def order_table(docx)
    order = [%w[Index Name Amount]]

    @bill.order.order_lines.each_with_index do |line, index|
      order << [index + 1, line.product.name, line.quantity]
    end

    docx.table order, border_size: 4 do
      cell_style rows[0], bold: true, background: '3366cc', color: 'ffffff'
      cell_style cells, size: 18, margins: { top: 100, bottom: 0, left: 100, right: 100 }
    end
  end

  def payment(docx, bill)
    payments = []
    bill.bill_lines.each do |line|
      payments << [line.payment.name, line.amount]
    end

    payments.each do |line|
      docx.p do
        text "#{line.first}: #{line.last}", alignment: :right, size: 24, bold: true
      end
    end
  end
  attr_reader :bill
end
