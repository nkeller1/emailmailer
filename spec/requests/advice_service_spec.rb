describe 'Advice Service' do
  it 'retrives advice successfully' do
    service = AdviceService.new
    response = service.advice_info

    expect(response).to have_key(:slip)
    expect(response[:slip]).to have_key(:advice)
    expect(response[:slip]).to have_key(:slip_id)
  end
end
