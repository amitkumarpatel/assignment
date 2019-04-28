This code returns return all possible words or combinations of words from the provided dictionary, that can be mapped back as a whole to the number. 

Example:
input = 6686787825

output = ["MOTORTRUCK", "MOT,OPT,PUCK", "MOT,OPT,RUCK", "MOT,OPT,SUCK", "MOT,ORT,PUCK", "MOT,ORT,RUCK", "MOT,ORT,SUCK", "NOT,OPT,PUCK", "NOT,OPT,RUCK", "NOT,OPT,SUCK", "NOT,ORT,PUCK", "NOT,ORT,RUCK", "NOT,ORT,SUCK", "OOT,OPT,PUCK", "OOT,OPT,RUCK", "OOT,OPT,SUCK", "OOT,ORT,PUCK", "OOT,ORT,RUCK", "OOT,ORT,SUCK", "MOT,TAJ", "NOT,TAJ", "OOT,TAJ", "NOUN,STRUCK", "ONTO,STRUCK", "MOTOR,TRUCK", "MOTOR,USUAL", "NOUNS,TRUCK", "NOUNS,USUAL"]

another example
input = 2282668687

output = ["CATAMOUNTS", "ACT,BOO,TOTS", "ACT,BOO,TOUR", "ACT,CON,TOTS", "ACT,CON,TOUR", "ACT,COO,TOTS", "ACT,COO,TOUR", "BAT,BOO,TOTS", "BAT,BOO,TOUR", "BAT,CON,TOTS", "BAT,CON,TOUR", "BAT,COO,TOTS", "BAT,COO,TOUR", "CAT,BOO,TOTS", "CAT,BOO,TOUR", "CAT,CON,TOTS", "CAT,CON,TOUR", "CAT,COO,TOTS", "CAT,COO,TOUR", "ACT,AMOUNTS", "ACT,CONTOUR", "BAT,AMOUNTS", "BAT,CONTOUR", "CAT,AMOUNTS", "CAT,CONTOUR", "ACTA,MOUNTS"]

Steps explained

a) get the input of 10 digit number.

b) validate iput to be a proper phone number else display messge to provide proper phone number.

c) get the combination of numbers that are possible to generate words from dictionary
	 The function get_combination_of_number() returns the required array
	for 6686787825
	output ["668", "678", "7825", "668", "6787", "825", "6686", "787", "825", "668", "6787825", "6686787", "825", "6686", "787825", "668678", "7825", "66867", "87825", "6686787825"]

d) load the words from dictionary in to different variables as the word size
	 The function load_words_dictionary() loads the words from dictionary.

e) get words combination for each of the number combination string above. 
    Example:
     for "668" words: MOT, NOT, OOT
         "678" words: OPT, ORT 	
         "7825" words: PUCK, RUCK, SUCK
         "668" words: MOT, NOT, OOT
         "6787" words: "OPTS", "OPUS", "ORTS"
         "825" words: TAJ
         "6686" words "NOUN", "ONTO"
         "787"  words "PUP", "PUR", "PUS", "SUP", "SUQ"
         "825"  words TAJ

f) loop and generate the desired string output by adding a comma between the strings
 	The function make_words() returns the required string array
 	Example: 
 		"MOT,OPT,PUCK", "MOT,OPT,RUCK", "MOT,OPT,SUCK", "MOT,ORT,PUCK", "MOT,ORT,RUCK", "MOT,ORT,SUCK", "NOT,OPT,PUCK", "NOT,OPT,RUCK", "NOT,OPT,SUCK", "NOT,ORT,PUCK", "NOT,ORT,RUCK", "NOT,ORT,SUCK", "OOT,OPT,PUCK", "OOT,OPT,RUCK", "OOT,OPT,SUCK", "OOT,ORT,PUCK", "OOT,ORT,RUCK", "OOT,ORT,SUCK"