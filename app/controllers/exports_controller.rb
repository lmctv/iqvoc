# encoding: UTF-8

# Copyright 2011-2013 innoQ Deutschland GmbH
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

class ExportsController < ApplicationController

  before_action do
    authorize! :export, Concept::Base
  end

  def index
    @export = Export.new
    @exports = Export.order('id DESC')
  end

  def show
    @export = Export.find(params[:id])
  end

  def create
    export = Export.create! do |e|
      e.user = current_user,
      e.file_type = params[:export][:file_type],
      e.token = srand
    end

    filename = export.build_filename
    job = ExportJob.new(export, filename,export.file_type, request.host_with_port)
    Delayed::Job.enqueue(job)

    flash[:success] = t('txt.views.export.success')
    redirect_to exports_path
  end

  def download
    export = Export.find(params[:export_id])
    time = export.finished_at.strftime("%Y-%m-%d_%H-%M")
    send_file export.build_filename,
              filename: "export-#{time}.#{export.file_type}"
  end

end
