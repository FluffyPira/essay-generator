# Pira's super special random essay generator v 0.0.3.0
Something I was messing around with at work and wanted to share. It uses Marky Markov to parse a text file of whatever you want it to and generate really bad essays based on that.

##Usage:
This application requires dictionary.txt in the /dictionary folder by default. If you wish to use a differently named dictionary, specify it as an argument.

``` ./bin/essay-generator [dictionary/*.txt]
```

There is also a nifty dictionary cleaner to clean up and remove all the special characters out of a text file. 

``` ./bin/dictionary-cleaner [textfile].txt```

If you wish to change the structure of the essays that are outputted. There is a config.yml in the /bin folder.