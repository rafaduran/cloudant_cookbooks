#
# Cookbook Name:: bigcouch
# Recipe:: crawler
# Author:: Rafael Durán Castañeda <rafadurancastaneda@gmail.com>
#
# Copyright 2011, Rafael Durán Castañeda
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "bigcouch"

package "curl" do
    action :install
end

# Discovering nodes
node["bigcouch"]["nodes"].each do |bnode|
  execute "curl -X PUT http://localhost:5986/nodes/#{bnode} -d '{}'" do
    action :run
  end
end

