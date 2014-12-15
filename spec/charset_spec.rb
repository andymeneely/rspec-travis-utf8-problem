# encoding: UTF-8
describe 'string character sets' do 

  it 'works reflexively' do
    expect('a').to eq('a')
  end

  it 'works on both escaped' do
    expect("\u00B5").to eq("\u00B5")
  end

  it 'works when both inline' do
    expect("µ").to eq("µ")
  end

  it 'works when inline and escaped' do
    expect("♠").to eq("\u2660")
  end

  # This is the one that fails for me on Travis and nowhere else
  it 'works on written file compared with escaped' do
    File.open("tmp.txt", 'w+') { |f| f.write("\u2660") }
    str = File.open("tmp.txt", 'r:UTF-8').read
    expect("\u2660").to eq(str)
  end

end
