#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.xpath('text()').last.text.tidy
    end

    def position
      noko.css('strong').text.tidy
    end
  end

  class Members
    def member_items
      super.reject { |mem| mem.name.to_s.empty? }
    end

    def member_container
      noko.css('td.tableGovermentMembers .tdGovermentMemberText')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
