class ChangeSongReleasedYearNameToRelease < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :released_year, :release_year
  end
end
