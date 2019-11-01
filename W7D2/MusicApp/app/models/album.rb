# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  album_type :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :album_type, :band_id, presence: true
  validates :title, uniqueness: { scope: :band_id }

  belongs_to :band,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  foreign_key: :album_id,
  class_name: :Track,
  dependent: :destroy
end
