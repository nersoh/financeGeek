require 'rails_helper'

RSpec.describe Currency, type: :model do
  let(:currency) { build(:currency) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :buy }
  it { should validate_presence_of :sell }
  it { should validate_presence_of :variation }
end
