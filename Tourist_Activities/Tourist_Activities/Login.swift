
import SwiftUI

struct Login: View {
    @State private var useremail:String = ""
    @State private var password:String = ""
    @State private var remember:Bool = true
    @State private var loginlink:Int? = nil
    @State var errormessage = false
    @State var emailerror = false
    @State var passerror = false
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                
                Text("Login")
                    .foregroundColor(Color(UIColor(named: "titlecolor") ?? UIColor(Color.blue)))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(15)
                
                TextField("Enter Your Email Address",text: $useremail)
                    .padding(15)
                    .foregroundColor(Color.blue)
                    .textInputAutocapitalization(.never)
                    .background(Color.gray.opacity(0.3))
                    .disableAutocorrection(true)
                    .font(.headline)
                    .cornerRadius(20)
                    .padding(10)
                
                SecureField("Enter Password",text: $password)
                    .padding(15)
                    .foregroundColor(Color.blue)
                    .textInputAutocapitalization(.never)
                    .background(Color.gray.opacity(0.3))
                    .disableAutocorrection(true)
                    .font(.headline)
                    .cornerRadius(20)
                    .padding(10)
                
                Toggle("Remember Me", isOn: self.$remember)
                    .padding(15)
                
                NavigationLink(destination:ContentView(),tag: 1, selection: $loginlink){}
                
                Button(action:{
                    
                    if(self.useremail.isEmpty && self.password.isEmpty){
                        self.errormessage = true
                    }
                    
                    else{
                        if(!self.useremail.contains("@gmail.com")){
                            self.emailerror = true
                        }
                        
                        else if(self.password.count<8){
                            self.passerror = true
                            
                        }
                        else{
                            if(!self.remember){
                                self.loginlink = 1
                            }
                            else{
                                UserDefaults.standard.set(self.useremail, forKey: "EMAIL")
                                UserDefaults.standard.set(self.password, forKey: "PASSWORD")
                                UserDefaults.standard.set(self.remember , forKey: "ToggleState")
                                UserDefaults.standard.set([] , forKey: "Fav_list")
                                self.loginlink = 1
                            }
                        }
                    }
                })
                {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(named: "button") ?? UIColor(Color.blue)))
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .frame(maxWidth: 120)
                }
                .background(Color.blue)
                .cornerRadius(70)
                //.frame(maxWidth:700)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.blue,lineWidth: 0)
                        .foregroundColor(.black)
                )
                Spacer()
                if errormessage {
                    Text("Please complete personal info")
                        .foregroundColor(Color.red)
                }
                if(emailerror){
                    Text("Please enter valid email address")
                        .foregroundColor(Color.red)
                }
                if passerror{
                    Text("Password must contains atleast 8 word")
                        .foregroundColor(Color.red)
                }
                
            }
            .navigationBarHidden(true)
            .onAppear(){
                NavigationLink(destination:ContentView(),tag: 2, selection: $loginlink){}
                self.useremail =  UserDefaults.standard.string(forKey: "EMAIL") ?? self.useremail
                self.password = UserDefaults.standard.string(forKey: "PASSWORD") ?? self.password
                self.remember = UserDefaults.standard.bool(forKey: "ToggleState")
                print(self.useremail)
                print(self.password)
                print(self.remember)
                if(UserDefaults.standard.bool(forKey: "ToggleState")){
                    self.loginlink = 1
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
