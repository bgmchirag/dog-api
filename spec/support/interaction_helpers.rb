RSpec.shared_context 'interactions' do
  let(:inputs) { {} }
  let(:outcome) do
    described_class.run(inputs)
  end
  let(:result) { outcome.result }

  subject { result }
end

RSpec.configure do |rspec|
  rspec.include_context 'interactions', type: :interaction
end