function temp() {
	var mail = document.getElementById("txtEmail").value;
	document.getElementById("tmpfp").setAttribute("href",
			"ForgotPassword.jsp?txtEmail=" + mail); // forgetpassword js
}

function validate() {
	var username = document.getElementById("txtEmail").value;
	var password = document.getElementById("txtPassword").value;
	if (username == "Formget" && password == "formget#123") {
		alert("Login successfully");
		return false;
	} else {
		attempt--;// Decrementing by one.
		alert("You have left " + attempt + " attempt;");
		// Disabling fields after 3 attempts.
		if (attempt == 0) {
			document.getElementById("txtEmail").disabled = true;
			document.getElementById("txtPassword").disabled = true;
			document.getElementById("submit").disabled = true;
			return false;
		}
	}
}

function onProductChangeSetPrice(){
	if(document.getElementById("productDrop").value!=null && document.getElementById("productDrop").value!= ""){
		document.getElementById("txtPrice").value = document.getElementById("productDrop").value.split('~')[1];
		if(document.getElementById("txtQuantity").value != null){
			document.getElementById("txtTotal").value = document.getElementById("txtQuantity").value*document.getElementById("txtPrice").value;
		}
		
	}else{
		document.getElementById("txtPrice").value = 0;
		document.getElementById("txtTotal").value = 0;
	}
}

function onProductChangeSetPriceandAv(){
	document.getElementById("txtQuantity").value = document.getElementById("txtQuantity").value.replace(/^0+/, '');
	if(document.getElementById("productDrop").value!=null && document.getElementById("productDrop").value!= ""){
		document.getElementById("txtPrice").value = document.getElementById("productDrop").value.split('~')[1];
		document.getElementById("avlQnty").value = document.getElementById("productDrop").value.split('~')[2];
		if(document.getElementById("txtQuantity").value != null){
			if(Number(document.getElementById("txtQuantity").value) > Number(document.getElementById("avlQnty").value)){
				alert("Entered Quantity should not be more then Available Quantity.");
				document.getElementById("txtTotal").value = 0;
				document.getElementById("txtQuantity").value = 0;
			}
			else{
			document.getElementById("txtTotal").value = document.getElementById("txtQuantity").value*document.getElementById("txtPrice").value;
			}
		}
		
	}else{
		document.getElementById("txtPrice").value = 0;
		document.getElementById("txtTotal").value = 0;
		document.getElementById("avlQnty").value= 0;
	}
}

