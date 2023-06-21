class Song < ApplicationRecord
	belongs_to :artist 
	belongs_to :genre

 
end