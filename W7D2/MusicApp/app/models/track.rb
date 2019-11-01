# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text             not null
#  track_type :string           not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, :lyrics, :track_type, :album_id, presence: true
  validates :title, uniqueness: { scope: :album_id }

  belongs_to :album,
  foreign_key: :album_id,
  class_name: :Album

end
