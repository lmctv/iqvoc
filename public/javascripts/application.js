jQuery(document).ready(function() {
  var locale = $("meta[name=i18n-locale]").attr("content");

  $.each($("input.token_input_widget"), function(index, elem) {
    $(elem).val("");
    var query_url    = $(elem).attr("data-query-url");
    var options      = $.parseJSON($(elem).attr("data-options"));
    // Widget UI text translations get yielded into a meta tag in the head section of the page.
    // Parse them and merge the JSON hash with the default options.
    var translations = $.parseJSON($("meta[name=widget-translations]").attr("content"));
    
    options = $.extend(translations, options);
    
    $(elem).tokenInputNew(query_url, options);
  });
	
  // Label editing (inline notes)
  $("fieldset.note_relation ol li.inline_note.new").hide();
	
  $("fieldset.note_relation input[type=button]").click(function() {
    var source = $(this).parent().find("ol li:last-child");
		
    // special case for usage notes
    // a usage note contains a select box instead of a textarea
    var isUsageNote = source.find("label:first").attr("for").match(/^concept_umt_usage_notes/);
		
    if (source.is(":hidden")) {
      source.show();
      return false;
    }
		
    var clone = source.clone();
		
    if (!isUsageNote) {
      source.find("textarea").attr("id").match(/_(\d)_/);
    }
    else {
      source.find("select").attr("id").match(/_(\d)_/);
    }
		
    var count 		   = parseInt(RegExp.$1) + 1;
    var newIdCount 	 = '_' + count + '_';
    var newNameCount = '[' + count + ']';
		
    clone.find("label")
    .attr("for", source.find("label").attr("for").replace(/_\d_/, newIdCount));
    
    // console.log(clone);
			
    // clone.find("input")
    // .attr("id", source.find("input[type=hidden]").attr("id").replace(/_\d_/, newIdCount))
    // .attr("name", source.find("input[type=hidden]").attr("name").replace(/\[\d\]/, newNameCount));
		
    if (!isUsageNote) {
      clone.find("textarea")
      .val("")
      .attr("id", source.find("textarea").attr("id").replace(/_\d_/, newIdCount))
      .attr("name", source.find("textarea").attr("name").replace(/\[\d\]/, newNameCount));
    }
    clone.find("select")
    .attr("id", source.find("select").attr("id").replace(/_\d_/, newIdCount))
    .attr("name", source.find("select").attr("name").replace(/\[\d\]/, newNameCount));

    clone.addClass("new");

    $(this).parent().find("ol").append(clone);

    return false;
  });
	
  // Label editing (inline notes)
  $("li.inline_note input:checkbox").change(function() {
    if (this.checked) {
      $(this).parent().addClass("deleted");
    }
    else {
      $(this).parent().removeClass("deleted");
    }
  });
	
  // Datepicker
  $.datepicker.setDefaults($.datepicker.regional[locale]);
  $("input.datepicker").datepicker();
	
  // Dashboard table row highlighting and click handling
  $("tr.highlightable")
  .hover(
    function() {
      $(this).addClass("hover")
    },
    function() {
      $(this).removeClass("hover")
    }
    )
  .click(
    function() {
      window.location = $(this).attr("data-url")
    }
    );
	
  // Search
  $("button#language_select_all").click(function() {
    $("input[type=checkbox].lang_check").attr("checked", true);
  });
  $("button#language_select_none").click(function() {
    $("input[type=checkbox].lang_check").attr("checked", false);
  });

  // Tree
  var trees = $("ul.treeview");
  $.each(trees, function(index, value) {
    $(value).treeview($.parseJSON($(value).attr("data-remote-settings")));
  });

  $("ul.hybrid-treeview").each(function() {
    var url = $(this).attr("data-url");
    var container = this;
    $(this).treeview({
      collapsed: true,
      toggle: function() {
        var $this = $(this);
        if ($this.hasClass("hasChildren")) {
          var childList = $this.removeClass("hasChildren").find("ul");
          $.fn.treeviewLoad({
            "url": url
          }, this.id, childList, container);
        }
      }
    });
  });

  // New Label (Inflectional search)
  $("form#new_label input#label_value").keyup(function() {
    var notification = $("p.label_warning");
    $.ajax({
      type: 'GET',
      url: $(this).attr("data-remote"),
      dataType: "json",
      data: {
        query: $(this).val()
      },
      success: function (data) {
        if (data) {
          var msg = notification.attr("data-msg");
          notification.html(msg + " " + data.label.value).show();
        }
        else {
          notification.hide();
        }
      }
    });
  });
});
