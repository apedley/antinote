require 'spec_helper'

describe CategoriesController do
  before(:all) do 
    ApplicationController.stubs(:authorize_user).returns(true)
  end
  


end
