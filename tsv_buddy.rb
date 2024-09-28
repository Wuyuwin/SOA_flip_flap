# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    @data = []
    lines = tsv.split("\n")
    header =  lines[0].split("\t")
    @data = lines[1..-1].map do |line|
      values = line.split("\t")
      header.zip(values).to_h
    end
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    headers = @data.first.keys
    tsv = headers.join("\t")+"\n"
    @data.each do |record|
      values = headers.map { |header| record[header]}.join("\t")+"\n"
      tsv += values 
    end
    tsv
  end
end
