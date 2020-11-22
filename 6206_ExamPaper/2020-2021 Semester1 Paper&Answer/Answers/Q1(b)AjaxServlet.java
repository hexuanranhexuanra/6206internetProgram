package servlets;
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {     
    response.setContentType("text/xml");  
    response.setHeader("Cache-Control", "no-cache");  
    PrintWriter out = response.getWriter();  
    String searchString = request.getParameter("searchString");          
    List staffs = null;                     
    try{   
        LoanDBAO db = new LoanDBAO(); 
        List staffs = db.getLoanByStaffName(searchString);      
        if(books != null){    
            StringBuilder sbXML = new StringBuilder();          
            for (int i=0; i<staffs.size(); i++) {     
                StaffDetails staff = (StaffDetails) staffs.get(i);     
                sbXML.append("<Staff>");     
                sbXML.append("<Name>" + staff.getName() + "</Name>"); 
                sbXML.append("<LoanItems>");
                ItemsDetails itemDetails = staff.LoanItems(); 
                for (int j=0; j<itemDetails.size(); j++) {
                    Item item = (itemDetails) itemDetails.get(j);  
                    sbXML.append("<LoanItem>");     
                    sbXML.append("<Itemname>" + item.getName() + "</Itemname>"); 
                    sbXML.append("<LonaDetail>");
                    sbXML.append("<Qty>" + item.getQty() + "</Qty>"); 
                    sbXML.append("<LoanStart>" + item.getLoanStart() + "</LoanStart>"); 
                    sbXML.append("<LoanEnd>" + item.getLoanEnd() + "</LoanEnd>"); 
                    sbXML.append("</LonaDetail>");
                }
                sbXML.append("</LoanItems>");
                sbXML.append("</Staff>");    }           
                out.write("<Staffs>" + sbXML.toString() + "</Staffs>");        
            }  
        else {
            out.write("<Staffs>" + 'No tutors are found' + "</Staffs>"); 
        }
        } 
    catch (Exception e1){        
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);   
        response.resetBuffer();  
    } 
}