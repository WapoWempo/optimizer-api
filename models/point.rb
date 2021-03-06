# Copyright © Mapotempo, 2016
#
# This file is part of Mapotempo.
#
# Mapotempo is free software. You can redistribute it and/or
# modify since you respect the terms of the GNU Affero General
# Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# Mapotempo is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the Licenses for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Mapotempo. If not, see:
# <http://www.gnu.org/licenses/agpl.html>
#
require './models/base'


module Models
  class Point < Base
    field :matrix_index
    field :associated_stops, default: []

    validates_numericality_of :matrix_index, allow_nil: true

    belongs_to :vehicle_start, class_name: 'Models::Vehicle', inverse_of: :start_point
    belongs_to :vehicle_end, class_name: 'Models::Vehicle', inverse_of: :end_point
    belongs_to :location, class_name: 'Models::Location'

    def self.find_by_vehicle_id(*params)
      find_by_vehicle_start_id(*params) || find_by_vehicle_end_id(*params)
    end
  end
end
