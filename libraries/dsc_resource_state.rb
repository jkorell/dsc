#
# Author:: Adam Edwards (<adamed@getchef.com>)
#
# Copyright:: 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class DscResourceState

  attr_reader :resource_type

  attr_reader :properties

  def initialize(resource_type)
    @resource_type = resource_type
    @properties = Hash.new
  end

  def set_property(name, value)
    @properties[normalize_name(name)] = value
  end

  def get_property(name)
    @properties[normalize_name(name)]
  end  

  protected

  def normalize_name(name)
    name.is_a?(Symbol) ? name.to_s.downcase : name
  end
end

