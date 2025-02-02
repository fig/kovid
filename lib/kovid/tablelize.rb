# frozen_string_literal: true

require 'terminal-table'

module Kovid
  class Tablelize
    class << self
      def country_table(data)
        headings = %w[Cases Deaths Recovered]
        rows = []
        rows << [data['cases'], data['deaths'], data['recovered']]
        puts Terminal::Table.new(title: data['country'], headings: headings, rows: rows)
      end

      def full_country_table(data)
        headings = [
          'Cases',
          'Deaths',
          'Recovered',
          'Cases Today',
          'Deaths Today',
          'Critical',
          'Cases/Million'
        ]

        rows = []
        rows << [
          data['cases'],
          data['deaths'],
          data['recovered'],
          data['todayCases'],
          data['todayDeaths'],
          data['critical'],
          data['casesPerOneMillion']
        ]
        puts Terminal::Table.new(title: data['country'],
                                 headings: headings,
                                 rows: rows)
      end

      def compare_countries_table(data)
        headings = %w[Country Cases Deaths Recovered]
        rows = []

        data.each do |country|
          rows << [country['country'], country['cases'], country['deaths'], country['recovered']]
        end

        puts Terminal::Table.new(headings: headings, rows: rows)
      end

      def compare_countries_table_full(data)
        headings = ['Country', 'Cases', 'Deaths', 'Recovered', 'Cases Today', 'Deaths Today', 'Critical', 'Cases/Million']
        rows = []

        data.each do |country|
          rows << [country['country'], country['cases'], country['deaths'], country['recovered'], country['todayCases'], country['todayDeaths'], country['critical'], country['casesPerOneMillion']]
        end

        puts Terminal::Table.new(headings: headings, rows: rows)
      end

      def cases(cases)
        headings = %w[Cases Deaths Recoveries]

        rows = []

        rows << [cases['cases'], cases['deaths'], cases['recovered']]
        puts Terminal::Table.new(title: "Total # of incidents", headings: headings, rows: rows)
      end
    end
  end
end
