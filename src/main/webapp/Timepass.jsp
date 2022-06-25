<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<div class=""container">
<div class="f-group">
<label for="">State</label>
<select name="A" id="A" onchange="populate(this.id,'slct2')">
                      <option value="">-- Choose State --</option>
                      <option value="Maharasthra">Maharasthra</option>
                      <option value="Karnataka">Karnataka</option>
                      <option value=Gujarat>Gujarat</option>
                      <option value="UttarPradesh">UttarPradesh</option>
                      
                     
                    </select>


</div>
<div class=""f-group">
<label for="">City</label>
<select name="B" id="B"></select>


</div>




</div>


<script>
var diction = {
		  Maharasthra: ["Mumbai", "Pune", "Nashik"],
		  Karnataka: ["Udupi", "Banglore", "Manglore"],
		  Gujarat:["Ahemdabad","Surat","Vadodara"],
		  UttarPradesh:["Varanasi","Mirzapur","Pahaganj"]
		}

		// bind change event handler
		$('#A').change(function() {
		  // get the second dropdown
		  $('#B').html(
		      // get array by the selected value
		      diction[this.value]
		      // iterate  and generate options
		      .map(function(v) {
		        // generate options with the array element
		        return $('<option/>', {
		          value: v,
		          text: v
		        })
		      })
		    )
		    // trigger change event to generate second select tag initially
		}).change()


</script>

</body>
</html>