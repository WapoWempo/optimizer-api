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
  class Service < Base
    field :quantity, default: 1
    field :duration, default: 0
    field :late_multiplicator, default: 1
    field :exclusion_cost, default: nil
    validates_numericality_of :quantity
    validates_numericality_of :duration
    validates_numericality_of :late_multiplicator
    validates_numericality_of :exclusion_cost

    field :skills, default: []

    belongs_to :point
    has_many :timewindows, class_name: 'Models::Timewindow'

    belongs_to :vrp, class_name: 'Models::Vrp', inverse_of: :services
  end
end