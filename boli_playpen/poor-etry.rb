#!/usr/bin/env ruby
require 'randombag.rb'

prefix = Randombag.new(["In particular","On the other hand","However","Similarly","As a resultant implication","In this regard","Based on integral subsystem considerations","For example","Thus","In respect to specific goals", "Occasionally"])

bumf = Randombag.new(["a large portion of the interface co-ordination communication","a constant flow of effective information","the characterisation of specific criteria","initiation of critical subsystem development","the fully integrated test program","the product configuration baseline","any associated supporting element","the incorporation of additional mission constraints","the independent functional principle","a primary interrelationship between system and/or subsystem technologies"])

reason = Randombag.new(["must utilise and be functionally interwoven with","maximises the probability of project success and minimises the cost and time required for","adds explicit performance limits to","necessitates that urgent consideration be applied to","requires considerable systems analysis and trade off studies to arrive at","is further compounded, when taking into account","presents extremely interesting challenges to","recognises the importance of other systems and the necessity for","effects a significant implementation of","adds overriding performance constraints to"])

thing = Randombag.new(["the sophisticated hardware","the anticipated fourth generation equipment","the subsystem compatibility testing","the structural design, based on system engineering concepts","the preliminary qualification limit","the evolution of specifications over a given time period","the philosophy of commonality and standardisation","the greater fight-worthiness concept","any discrete configuration mode","the total system rationale"])


adjective = Randombag.new(["integrated","total","systematised","parallel","functional","responsive","optical","synchronised","compatible","balanced","management","organisational","monitored","reciprocal","digital","logic","transitional","incremental","third-generation","policy", "hydro-citrus"])

noun = Randombag.new(["options","flexibility","capability","mobility","programming","concept","time-phase","projection","hardware","contingency"])

sentences = Randombag.new(["P T R B A N.", "P B R T.", "P A A N R A A N."])

sentence = sentences.select_one

jargon = ''

sentence.each_char {|c|
	string = case c
	when "P" then prefix.select_one
	when "B" then bumf.select_one
	when "R" then reason.select_one
	when "T" then thing.select_one
	when "A" then adjective.select_one
	when "N" then noun.select_one
	else c
	end
	jargon += string
}

puts "Jargon = #{jargon}"
