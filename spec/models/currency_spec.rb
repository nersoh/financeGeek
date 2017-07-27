require 'rails_helper'

RSpec.describe Currency, type: :model do
  let(:currency) { build(:currency) }

  it { should validate_presence_of :dollar }
  it { should validate_presence_of :euro }
  it { should validate_presence_of :bitcoin }
end
