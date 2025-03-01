class Song < ApplicationRecord
    
    validates_presence_of :title, :artist_name

  #  validates :released, inclusion: { in: [true, false] }
    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
    end
    
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: 'cannot be repeated by the same artist in the same year'
      }
    
end
