public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}

	System.out.println(" ");
	System.out.println("=========");
	System.out.println(" ");

	String[] lines2 = loadStrings("LowellHymn.txt");
	for (int i = 0; i < lines2.length; i++){
	    String[] splited = lines2[i].split("\\s+");

	    for (int j = 0; j < splited.length; j++){
	  		System.out.print(pigLatin(splited[j]) + " ");
		}
		System.out.println(" ");
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord){
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	for(int i = 0; i < sWord.length(); i++){
		String letterToCheck = sWord.substring(i, i + 1);
		if(letterToCheck.equals("a") || letterToCheck.equals("e") || letterToCheck.equals("u") || letterToCheck.equals("i") || letterToCheck.equals("o")){
			return i;
		}
	}
	return -1;
}

public String pigLatin(String sWord){
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
	String punctuation = "";
	if(sWord.length() >= 1 && sWord.substring(sWord.length() - 1).equals(".")){
		sWord = sWord.substring(0, sWord.length() - 1);
		punctuation = ".";
	}else if(sWord.length() >= 1 && sWord.substring(sWord.length() - 1).equals(",")){
		sWord = sWord.substring(0, sWord.length() - 1);
		punctuation = ",";
	}
	if(sWord.length() == 0){
		return "";
	}
	else if(findFirstVowel(sWord) == -1){
		//all consonants word add "ay"
		return sWord + "ay" + punctuation;
	}
	else if(findFirstVowel(sWord) == 0){
		//word starts with vowel add "way"
		return sWord + "way" + punctuation;
	}
	else if(sWord.substring(0,2).equals("qu")){
		//for words that start with "qu" move "qu" and add "ay"
		return sWord.substring(2) + "quay" + punctuation;
	}
	else{
		//for general words move all consonants to back and add "ay"
		int vowel = findFirstVowel(sWord);
		return sWord.substring(vowel) + sWord.substring(0, vowel) + "ay" + punctuation;
	}
}
