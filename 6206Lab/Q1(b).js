function processXML(responseXML) {          
    var Staffs = responseXML.getElementsByTagName("Staffs")[0];   
    var numStaffs = staffs.childNodes.length;   
    var myTable = '';    
    if (numStaffs > 0) {        
        myTable += '<Table border="1">';  
        myTable += '<thead style="background-color:lightblue">';    
        myTable += '<tr><th>Name</th><th>Loan Item</th></tr></thead>';      
        myTable += '<tbody>';  
        for (loop=0; loop< Staffs.childNodes.length; loop++){   
            var aStaff = Staffs.childNodes[loop];   
            var staffName = aStaff.getElementsByTagName("Name")[0];   
            var LoanItems = aStaff.getElementsByTagName("LoanItems")[0];
            myTable += '<tr><td>';       
            myTable += staffName.childNodes[0].nodeValue + '</td>';
            for (i=0; loop< LoanItems.childNodes.length; i++){ 
                var Item = LoanItems[i]
                var itemName = LoanItems
                myTable += '<td><b>' + Item.childNodes[0] + '</b>'; 
                var itemDetail = Item.childNodes[1]
                for (j=0; loop< itemDetail.childNodes.length; j++){
                    myTable += '<p>' + itemDetail[j].childNodes[0].nodeValue + '</p>'
                    myTable += '<p>' + itemDetail[j].childNodes[1].nodeValue + '</p>'
                    myTable += '<p>' + itemDetail[j].childNodes[2].nodeValue + '</p>'
                }
                myTable +='</td></tr>';    
            } 
        }    
        myTable += '</tbody>';   
        myTable += '</Table>';       //alert(myTable);      
        return myTable;   
    }   
}