package member;


public class MemberDTO{
   private String ID, PW,character, live, hobby, reli, name, classof, age, photo, introduce,gender,photo1,photo2,photo3,lasttime;
   int light;
   public MemberDTO() {
        super();
    }
 
    public MemberDTO(String id, String password,
            String live, String character, String hobby, String reli, String name, String classof, String age, String fileurl,String introduce,String gender,int light,String fileurl1,String fileurl2, String fileurl3,String lasttime) {
        super();
        this.ID = id;
        this.PW = password;
        this.character = character;
        this.live = live;
        this.hobby = hobby;
        this.reli = reli;
        this.name = name;
        this.classof = classof;
        this.age = age;
        this.photo = fileurl;
        this.introduce=introduce;
        this.gender=gender;
        this.light=light;
        this.photo1=fileurl1;
        this.photo2=fileurl2;
        this.photo3=fileurl3;
        this.lasttime=lasttime;
    }
    public void setlasttime(String lasttime){
        this.lasttime=lasttime;
     }
     public String getlasttime(){
        return lasttime;
     }
    public String getPhoto1(){
        return photo1;
     }
     public void setPhoto1(String photo1){
        this.photo1=photo1;
     }
     public String getPhoto2(){
         return photo2;
      }
      public void setPhoto2(String photo2){
         this.photo2=photo2;
      }
      public String getPhoto3(){
          return photo3;
       }
       public void setPhoto3(String photo3){
          this.photo3=photo3;
       }
    public void setlight(int light){
    	this.light=light;
    }
    public int getlight(){
    	return light;
    }
    public MemberDTO(String photo){
       this.photo=photo;
    }
    public void setgender(String gender){
       this.gender=gender;
    }
    public String getgender(){
       return gender;
    }
    public void setintroduce(String introduce){
       this.introduce=introduce;
    }
    public String getintroduce(){
       return introduce;
    }
   public String getID(){
      return ID;
   }
   public String getPhoto(){
      return photo;
   }
   public void setPhoto(String photo){
      this.photo=photo;
   }
   public void setID(String ID){
      this.ID=ID;
   }public String getPW(){
      return PW;
   }
   public void setPW(String PW){
      this.PW=PW;
   }
   public String getCharacter(){
      return character;
   }
   public void setCharacter(String character){
      this.character=character;
   }
   public String getlive() {
           return live;
   }
      
   public void setlive(String live) {
          this.live = live;
   }
   
   public String gethobby() {
          return hobby;
   }
       
   public void sethobby(String hobby) {
           this.hobby = hobby;
   }
      
   public String getreli() {
          return reli;
   }
      
   public void setreli(String reli) {
           this.reli = reli;
   }
       
   public String getName() {
           return name;
   }
      
   public void setName(String name) {
           this.name = name;
   }
       
   public String getClassof() {
           return classof;
   }
      
   public void setClassof(String classof) {
         this.classof = classof;
   }
       
   public String getAge() {
        return age;
   }
       
   public void setAge(String age) {
           this.age = age;
   }
}