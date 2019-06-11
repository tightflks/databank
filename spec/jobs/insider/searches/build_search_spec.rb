require 'rails_helper'

RSpec.describe Insider::Searches::BuildSearch do
  let(:columns) { Insider::Search::Columns }

  describe 'apartments' do
    it 'queries every field without error for apartments' do
      expect(search_on_every_field(Apartment, skip: %w[square_ft_start square_ft_end]).to_a).to eql([])
    end

    Insider::Search::Columns.each do |col|
      it "sorts on #{col}" do
        expect(ordered_search(Apartment, col, 'asc').to_a).to eql([])
        expect(ordered_search(Apartment, col, 'desc').to_a).to eql([])
      end
    end
  end

  describe 'franchises' do
    it 'queries every field without error for franchises' do
      expect(search_on_every_field(Franchise).to_a).to eql([])
    end

    Insider::Search::Columns.each do |col|
      it "sorts on #{col}" do
        expect(ordered_search(Franchise, col, 'asc').to_a).to eql([])
        expect(ordered_search(Franchise, col, 'desc').to_a).to eql([])
      end
    end
  end

  describe 'industrial' do
    it 'queries every field without error for industrial' do
      expect(search_on_every_field(Industrial).to_a).to eql([])
    end

    Insider::Search::Columns.each do |col|
      it "sorts on #{col}" do
        expect(ordered_search(Industrial, col, 'asc').to_a).to eql([])
        expect(ordered_search(Industrial, col, 'desc').to_a).to eql([])
      end
    end
  end

  describe 'lands' do
    it 'queries every field without error for lands' do
      expect(search_on_every_field(Land).to_a).to eql([])
    end

    Insider::Search::Columns.each do |col|
      it "sorts on #{col}" do
        expect(ordered_search(Land, col, 'asc').to_a).to eql([])
        expect(ordered_search(Land, col, 'desc').to_a).to eql([])
      end
    end
  end

  describe 'offices' do
    it 'queries every field without error for offices' do
      expect(search_on_every_field(Office).to_a).to eql([])
    end

    Insider::Search::Columns.each do |col|
      it "sorts on #{col}" do
        expect(ordered_search(Office, col, 'asc').to_a).to eql([])
        expect(ordered_search(Office, col, 'desc').to_a).to eql([])
      end
    end
  end

  private

  def search_on_every_field(klass, skip: [])
    search = Insider::Search.new(klass)

    Insider::Search::Properties.each do |property|
      search.send("#{property}=", 200) unless skip.include?(property)
    end

    Insider::Searches::BuildSearch.new.perform(search)
  end

  def ordered_search(klass, column, direction)
    search = Insider::Search.new(klass, sort_by: column, sort_order: direction)
    Insider::Searches::BuildSearch.new.perform(search)
  end

end
