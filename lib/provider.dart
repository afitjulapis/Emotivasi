import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class provider with ChangeNotifier{
  
  var selectedSurahIndex;
  var selectedSurahName;
  var selectedMp3Name;
  var selectedAyatName;

  var quoteFull;

  var searchTerm;
  var searchResultIndex=List<int>();
  
}