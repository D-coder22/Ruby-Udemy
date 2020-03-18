///////////////////////////////////////////////////////////////////////
//
// Search component for Rails-doc.org.
//
// Copyright (c) 2008, Nodeta Oy, Finland (www.nodeta.fi)
//
///////////////////////////////////////////////////////////////////////

var SearchField = Class.create({
  // Initialize search field. Parameters:
  // +elem+ is the HTML input field element
  // +resultsElem+ is the HTML output element
  // +minKeys+ is where the real searching starts
  // +data+ search data (JSON)
  // +project+ Name of the project, eg. rails
  // +projectMinVersion+ Minimum project version
  // +projectMaxVersion+ Maximum project version
  initialize: function(elem, resultsElem, submitSearchElement, minKeys, dataIndex, data, project, projectMinVersion, projectMaxVersion) {
    this.searchInput = elem;

    // Bring focus to search field
    this.searchInput.activate();

    this.minKeys = minKeys;
    this.dataIndex = dataIndex;
    this.data = data;
    this.project = project;
    this.projectMinVersion=projectMinVersion;
    this.projectMaxVersion=projectMaxVersion;

    this.submitSearchElement = submitSearchElement;

    this.clearResults();

    // Where we show our output
    this.resultsRoot = resultsElem;
    this.resultsRoot.hide();

    // DOM reference backwards
    this.searchInput.searchField = this;

    // Constants
    this.searchInterval = 0.2;

    this.initializeEventListeners();
    
    // Show results in case of query parameter
    if(window.location.href.toQueryParams()['q']) {
      this.searchInput.value = window.location.href.toQueryParams()['q'];
      this.searchInput.fire('keydown');
    }
  },

  initializeEventListeners: function() {
    new Form.Element.Observer(
      this.searchInput,
      this.searchInterval,
      this.onChange.bindAsEventListener(this)
    );

    // We're observing keydown, because Safari doesn't support keypress.
    this.searchInput.observe('keydown', this.onKeypress.bindAsEventListener(this));
    this.searchInput.observe('keyup', this.onKeyUp.bindAsEventListener(this));
    this.searchInput.observe('blur', this.onBlur.bindAsEventListener(this));
    this.searchInput.observe('focus', this.onFocus.bindAsEventListener(this));
  },


  // Called when the search field has been changed.
  onChange: function(element, foobar) {
    var searchField = element.searchField;

    var searchWord = element.value;
    var length = searchWord.length;

    if (length >= this.minKeys) {
      searchField.searchBy(searchWord);
    } else {
      // Field length is too small: reset previous results
      this.clearResults();
      searchField.resultsRoot.hide();
    }
  },

  // Handle keypresses: esc/up/down
  onKeypress: function(event) {
    var element = event.element();

    switch (event.keyCode) {
      case Event.KEY_ESC: this.cancelSearch(true); break;
      case Event.KEY_UP: this.activateResultByOffset(-1); break;
      case Event.KEY_DOWN: this.activateResultByOffset(1); break;
      case Event.KEY_RETURN: this.onLaunch(); break;
    }
  },

  // Handle keyup: after the text has been written
  onKeyUp: function(event) {
    var element = event.element();

    if (element.value.length > 0) {
      this.submitSearchElement.addClassName('submit_search_active');
      this.submitSearchElement.title = "Click here for a full-text search.";
    } else {
      this.submitSearchElement.removeClassName('submit_search_active');
      this.submitSearchElement.title = null;
    }
  },

  // User wants to select currently active search result
  onLaunch: function() {
    if (this.activeResult) {
      this.activeResult.launch();
    } else {
      this.fullTextSearch();
    }

    this.searchInput.blur();
  },

  // Lost focus
  onBlur: function(event) {
    this.cancelSearch(false);
    setTimeout('fieldFocus = false',500);
  },

  // Got focus back
  onFocus: function(event) {
    fieldFocus = true;
    if (this.activeResult) {
      this.resultsRoot.show();
    }
  },

  // Move up or down by offset
  activateResultByOffset: function(offset) {
    var oldPosition = (this.activeResult != null)? this.activeResult.position : 0;
    var newActive = null;

    if (this.previousResults == null || this.previousResults.length == 0) {
      this.activeResult = null;
      return;
    }

    // Going up from first element or down from last element.
    if (oldPosition + offset < 0) {
      newActive = this.previousResults.last();
    } else if (oldPosition + offset >= this.previousResults.length) {
      newActive = this.previousResults.first();
    } else {
      newActive = this.previousResults[oldPosition + offset];
    }

    this.activateResult(newActive);
    var highestVisible = document.viewport.getScrollOffsets().top;
    var lowestVisible = highestVisible + document.viewport.getHeight();
    var highestPoint = newActive.resultElement.positionedOffset().top+this.resultsRoot.positionedOffset().top;
    var lowestPoint = highestPoint + newActive.resultElement.getHeight();

    if (highestPoint+2 < highestVisible) newActive.resultElement.scrollTo();
    if (lowestVisible < lowestPoint) scrollBy(0, (lowestPoint-lowestVisible));
  },

  // Activate a SearchResult object
  activateResult: function(result) {
    if (this.activeResult) {
      this.activeResult.deactivate();
    }

    this.activeResult = result;

    if (this.activeResult) {
      this.activeResult.activate();
    }
  },

  // Search by word: possibly optimizes by utilizing a previous result set.
  searchBy: function(word) {
    var length = word.length;

    // User presses backspace - we have to do a full search again.
    if (length < this.lastSearchWordLength) {
      this.clearResults();
    }

    if (this.previousResults) {
      this.searchFromPrevious(word);
    } else {
      this.searchFrom(word, this.dataIndex, this.data);
    }

    this.lastSearchWordLength = length;
    this.lastSearchWord = word;

    this.updateResultPositions(word);

    if (!this.activeResult && this.previousResults.length > 0) {
      this.activateResult(this.previousResults[0]);
    }

    this.updateResultsUI();
  },

  // Internal: Search word from data using a data index.
  // Always creates new SearchResults.
  searchFrom: function(word, dataIndex, data) {
    var results = new Array();
    var filteredWord = word.toLowerCase();

    var mid = this.binarySearch(filteredWord, dataIndex, 0, dataIndex.length);

    if (mid == null || mid == -1) {
      this.previousResults = new Array();
      return null;
    }

    var first = this.searchRangeLower(filteredWord, dataIndex, mid);
    var last = this.searchRangeHigher(filteredWord, dataIndex, mid);

    var resultCount = 0;
    var foundIds = new Array();

    for (var i=first; i<=last; i++) {
      var dataId = dataIndex[i][1];

      if (foundIds.indexOf(dataId) == -1) { // Not previously found
        foundIds.push(dataId);

        var item = data[dataId];

        results.push(new SearchResult(this, item, resultCount++));
      }
    }

    this.previousResults = results;

    return results;
  },

  searchRangeLower: function(word, data, mid) {
    for (var i=mid; i>=0; i--) {
      var keyword = data[i][0];
      if (!this.match(keyword, word)) return i + 1;
    }

    return 0;
  },

  searchRangeHigher: function(word, data, mid) {
    for (var i=mid; i<data.length; i++) {
      var keyword = data[i][0];
      if (!this.match(keyword, word)) return i - 1;
    }

    return data.length - 1;
  },

  binarySearch: function(word, data, low, high) {
    if (high < low) return -1; // not found

    var mid = parseInt((low + high) / 2);
    var keyword = data[mid][0];

    // Found something!
    if (this.match(keyword, word, true)) { // require a "match in the beginning"
      return mid;
    }

    if (keyword > word) {
      return this.binarySearch(word, data, low, mid - 1);
    } else if (keyword < word) {
      return this.binarySearch(word, data, mid + 1, high);
    } else {
      return null;
    }
  },

  // Internal: Search word from previous results.
  // Reuses existing SearchResults.
  searchFromPrevious: function(word) {
    var length = this.previousResults.length;
    var results = new Array();

    for (var i=0; i<length; i++) {
      var result = this.previousResults[i];

      if (this.match(result.item.name, word)) {
        results.push(result);
      } else {
        result.dispose();
      }
    }

    this.previousResults = results;
  },

  // Does +str+ contain +word+?
  match: function(str, word, requireStartMatch) {
    var filteredStr = str.toLowerCase();
    var filteredWord = word.toLowerCase();

    if (requireStartMatch) {
      if (filteredStr.startsWith(filteredWord)) return true;
    } else {
      if (filteredStr.match(filteredWord)) return true;
    }

    // The index also splits by _, so we need to find stuff like to_sentence (by "to")
    var parts = filteredWord.split("_");
    if (filteredStr == parts[0]) {
      return true;
    }

    return false;
  },

  // Redraw the results element
  updateResultsUI: function() {
    var resultsRoot = this.resultsRoot;

    // Clear the element
    resultsRoot.innerHTML = '';

    // Add results
    for (var i=0; i<this.previousResults.length; i++) {
      var result = null;

      // IE cannot reuse existing HTML elements
      if (Prototype.Browser.IE) {
        result = new SearchResult(this, this.previousResults[i].item, i);
        result.createElement();
        this.previousResults[i] = result;
      } else {
        result = this.previousResults[i];
      }

      resultsRoot.appendChild(result.resultElement);
    }

    // What if nothing was found?
    if (this.previousResults.length == 0) {
      resultsRoot.innerHTML = '<li class="not_found"><span>No results found, press <strong>Enter</strong> to access full-text search.</span></li>';
    }

    resultsRoot.show();
  },

  // Stop searching
  cancelSearch: function(clearField) {
    if (clearField) {
      this.searchInput.value = '';
      this.clearResults();
    }

    if (this.resultsRoot.visible()) {
      this.resultsRoot.hide.bind(this.resultsRoot).delay(1);
      new Effect.BlindUp(this.resultsRoot, { duration: 0.3 });
    }
  },

  clearResults: function() {
    this.activeResult = null;
    this.previousResults = null;
    this.lastSearchWordLength = 0;
  },

  // Update result positions and invalidate +this.activeResult+ if needed.
  updateResultPositions: function(word) {
    var foundActive = false;

    // Sort by score
    this.previousResults = this.previousResults.sortBy(function(result) {
      return -1 * result.relativeScoreFor(word);
    });

    for (var i=0; i<this.previousResults.length; i++) {
      var result = this.previousResults[i];
      result.position = i;
      
      if (result.active) {
        foundActive = true;
      }
    }

    if (!foundActive) {
      this.activeResult = null;
    }
  },

  fullTextSearch: function() {
    var path = '/' + this.project + '/search?query=' + escape(this.lastSearchWord.strip());
    window.location.href = path;
  }

});

var SearchResult = Class.create({
  initialize: function(searchField, item, position) {
    this.searchField = searchField;
    this.item = item;
    this.position = position;
    this.active = false;

    this.createElement();
  },

  createElement: function() {
    this.resultElement = new Element('li');
    this.resultElement.addClassName(this.item.type);

    this.resultElement.innerHTML = this.item.name + '<br /><span style="background-image: url( ' +
    this.createScoreURL(this.item.score) + ');">' + this.item.path + ' ' + this.createVersionString(this.item.versions) + '</span>';

    this.resultElement.observe('click', this.onClick.bindAsEventListener(this));
    this.resultElement.observe('mouseover', this.onMouseOver.bindAsEventListener(this));

    return this.resultElement;
  },

  createScoreURL: function(score) {
    // Has to be in sync with ApplicationHelper#importance_img
    return "/images/importance_" + Math.min(Math.ceil(score / 120 * 5), 5) + "_sm.png";
  },

  createVersionString: function(versionArray) {
    var itemMinVersion = versionArray.first();
    var itemMaxVersion = versionArray.last();
    
    var versionString='';
    if (this.searchField.projectMinVersion != itemMinVersion && ('v'+this.searchField.projectMinVersion) != itemMinVersion) {
      versionString = '(>= ' + itemMinVersion;
    }
    if (this.searchField.projectMaxVersion != itemMaxVersion && ('v'+this.searchField.projectMaxVersion) != itemMaxVersion) {
      if (versionString != '') {
        versionString += ' <= ';
      } else {
        versionString = '(<= ';
      }
      versionString += itemMaxVersion + ')';
    } else if (versionString != '') {
      versionString += ')';
    }
    return versionString+'<!-- '+ 'itemMin:'+itemMinVersion+' itemMax:'+itemMaxVersion+' projMin:'+this.searchField.projectMinVersion+' projMax:'+this.searchField.projectMaxVersion+' -->';
  },

  activate: function() {
    this.resultElement.addClassName('active_result');
    this.active = true;
  },

  deactivate: function() {
    this.resultElement.removeClassName('active_result');
    this.active = false;
  },

  launch: function() {
    var path = '/' + this.item.project + '/' + ((this.item.path != '-') ? (this.item.path.gsub('::', '/') + '/') : '') + escape(this.item.name);
    if (this.item.method_type == 'class') { path += '/class'; }

    // AJAX is so beginning-of-2000s.
    window.location.href = path;
  },

  onClick: function(event) {
    this.launch();
  },

  onMouseOver: function(event) {
    this.searchField.activateResult(this);
  },

  // Get rid of the HTML element.
  dispose: function() {
    this.resultElement.remove();
  },

  // Count a score when we know what the user is looking for...
  relativeScoreFor: function(word) {
    var relativeFactor = this.item.name.toLowerCase().startsWith(word.toLowerCase())? 3:1;
    return this.item.score * relativeFactor;
  }

});
