class ChangeIdToOne < ActiveRecord::Migration[7.0]
  def change
    def up
      execute("ALTER TABLE users AUTO_INCREMENT = 1; ") 
    end

    def down
      execute("ALTER TABLE users AUTO_INCREMENT = 1; ")
    end
  end
end
