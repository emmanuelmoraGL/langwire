# frozen_string_literal: true

class GraphicalOutput
  include ActiveAwsRecord::Base

  string_attr :name
  string_attr :url
  string_attr :format
end
