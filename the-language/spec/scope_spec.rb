# Notice that we have define everything inside the Scopes module
module Scopes
  RSpec.describe "scope" do
    module Jims
      class Dog_1
        def identify
          :jims_dog
        end
      end
    end

    module Joes
      class Dog_1
        def identify
          :joes_dog
        end
      end
    end

    it "cannot access Dog in the current scope" do
      expect {
        Dog_1.new
      }.to raise_error( NameError )
    end

    it "can reference nested classes using the scope operator" do
      fido = Jims::Dog_1.new
      rover = Joes::Dog_1.new
      expect( fido.identify ).to eq( :jims_dog )
      expect( rover.identify ).to eq( :joes_dog )

      expect( fido.class != rover.class ).to eq( true )
      expect( Jims::Dog_1 != Joes::Dog_1 ).to eq( true )
    end

    class String
    end

    it "assumes the current scope for 'bare' constants" do
      expect( Scopes::String == String ).to eq( true )
    end

    it "creates new constants - our nested string is not the same as they system String" do
      expect( String == "HI".class ).to eq( false )
    end

    it "can use the prefix :: to access top-level classes" do
      expect( ::String == "HI".class ).to eq( true )
    end

    PI = 3.1416

    it "defines constants with an upper case first letter" do
      expect( PI ).to eq( 3.1416 )
    end

    MyString = ::String

    it "uses constants as class names" do
      expect( MyString == ::String ).to eq( true )
      expect( MyString == "HI".class ).to eq( true )
    end

    it "can look up constants explicitly" do
      expect( PI == Scopes.const_get("PI") ).to eq( true )
      expect( MyString == Scopes.const_get("MyString") ).to eq( true )
    end

    it "can give you a list of all constants for any class or module" do
      expect( Jims.constants ).to eq( [:Dog_1] )
      expect( Object.constants.size > 100 ).to be_truthy
    end
  end
end
