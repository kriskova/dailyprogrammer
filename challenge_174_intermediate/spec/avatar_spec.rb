require 'spec_helper'

describe Avatar do
  describe 'New Avatar initialize' do
    before(:each) do
      allow_any_instance_of(Avatar).to receive(:generate_image).and_return("/images")
      @avatar = Avatar.new("John")
    end

    it 'should have a not nil name' do
      expect(@avatar.name).to eq("John")
    end

    it 'should have an image url' do
      expect(@avatar.image).to_not eq(nil)
    end
  end
  
  describe 'Generate image' do
    before(:each) do
      @path = File.expand_path("../../",__FILE__)
      Dir.glob(File.join(@path,"images/*.png")).each {|f| File.delete(f)} 
    end

    it 'should create an SHA-1 hash from name' do
      expect(Digest::SHA1).to receive(:hexdigest).with("john")
      .and_return("b765ebcd303e4c3387ab8aa8166efb252cb426db")
      Avatar.new("john")
    end

    it 'should create a new file with avatars name' do
      Avatar.new("jenny")
      expect(File.exist?(File.join(@path,"/images"))).to eq(true)
    end

    it 'the image should be bigger than 64 bytes' do
      a = Avatar.new("kriskova")
      expect(File.stat(a.image).size).to be > 64 
    end

  end
end
