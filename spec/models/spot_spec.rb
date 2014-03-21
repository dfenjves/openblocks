require 'spec_helper'

describe Spot do

	let(:met) do 
		met = Spot.new
		met.new_spot("CoQBfwAAAEFk20AyXdXtjqw2NLWq5b8GF7JAerg8ShD8VEEefN40UaDyaies7o62L4HY9knvD3xRdzId3wPn6Q70nR3yoxysYQW78EWgLk_Z4n27nSdRyLLcbyGn7RGyeHuz2IPuXoKBP6r8fLmmuLs9fEGsnM3cySDAtzCZHFUFuv87bOnlEhDOgGtIj_egoC3UUMBP8LyLGhQORDSxRPHivGrK7Y5XmRddVSNEDw")
		met
	end

	let(:queens_museum) do 
		queens_museum = Spot.new
		queens_museum.new_spot("CnRuAAAA9Z5c8Rlf--mkGTKmY3qdNhoWOQMKoJ5glR1TxgEMEl567uf3yvC9SlzggED7wQdJ61UDHipMS_txJ4nTZukENGJWrPZH_dLwswygUq3dYHSsvGLi-MKBoMq6NpvW_-gBm1DVyKfFn5ZyNNyTEzWf-RIQ0pKI47vD7JoOHMqRGMvA8xoUnFscJVvHUvvc-L0CpIfiuGHbnJA")
		queens_museum
	end

  it 'assigns a name to the spot' do
  	expect(met.name).to eq("The Metropolitan Museum of Art")
  end

  it 'assigns a website to the spot' do
  	expect(met.website).to eq("http://www.metmuseum.org/")  	
  end

  it 'assigns an address to the spot' do
  	expect(met.address).to eq("1000 5th Ave, New York, NY, United States")	  	
  end

  it 'assigns values to each opening and closing day' do
  	expect(met.monday_open).to eq(1000)  	
  	expect(met.tuesday_open).to eq(1000)  	
  	expect(met.wednesday_open).to eq(1000)  	
  	expect(met.thursday_open).to eq(1000)  	
  	expect(met.friday_open).to eq(1000)  	
  	expect(met.saturday_open).to eq(1000)  	
  	expect(met.sunday_open).to eq(1000)  	
  	expect(met.monday_close).to eq(1730)  	
  	expect(met.tuesday_close).to eq(1730)  	
  	expect(met.wednesday_close).to eq(1730)  	
  	expect(met.thursday_close).to eq(1730)  	
  	expect(met.friday_close).to eq(2100)  	
  	expect(met.saturday_close).to eq(2100)  	
  	expect(met.sunday_close).to eq(1730)  	
  end

  it 'sets the schedule as 0 for days when the place is closed' do
  	expect(queens_museum.monday_open).to eq(0)  	
  	expect(queens_museum.monday_close).to eq(0)  	
  end

end
