package member;


public class msgDTO{
   private String recipient, sender, content;
   public msgDTO()
   {
        super();
    }
 
    public msgDTO(String recipient, String sender, String content) {
        super();
       this.recipient = recipient;
       this.sender = sender;
       this.content = content;
    }
   
   public void setReci(String Reci) {
           this.recipient = Reci;
   }
   public void setSender(String sender) {
       this.sender = sender;
}
   public void setContent(String content) {
       this.content = content;
}  

   public String getReci() {
    return recipient;
}
   public String getSender() {
      return sender;
   }
   public String getContent() {
      return content;
   }
}