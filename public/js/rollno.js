	jQuery(document).delegate('#roll_no', 'change', function(e) {
		e.preventDefault();
		var rollNo = $('#roll_no').val();
		$.ajax({
				url		 : "/student/"+rollNo,
				dataType : "json",
				success:function(res){
					$('#full_name').val(res.student[0].name);
					$('#email').val(res.student[0].email);
					if(res.student[0].gender == 'Male'){
					$('#male').prop('checked',true);}
					else{
						$('#female').prop('checked',true);}
				},
				error:function() {
                    alert("error occured");
                }
			})
	})