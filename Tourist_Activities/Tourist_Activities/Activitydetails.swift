
import SwiftUI

struct Activitydetails: View {
    
    var selectedplace : Activities
    @EnvironmentObject var obj : AppData
    @State private var favactivitylink:Int? = nil
    
    var body: some View {
        VStack(alignment:.center){
            VStack(alignment:.center){
                
                Text("\(selectedplace.activitytitle)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.blue)
                    .padding(10)
                
                Text("Price: $\(selectedplace.price) /Person")
                
                HStack{
                    Image(selectedplace.image2)
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                        .border(.blue)
                    Image(selectedplace.image3)
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                        .border(.blue)
                }
                
                Text("\(selectedplace.deails)")
                    .padding(10)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity,alignment: .center)
                
                Text("\(selectedplace.ratings)")
                    .font(.system(size: 20))
                
                Text("")
                
                Text("Contact:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image(systemName:"phone" )
                Text("\(selectedplace.contact)\n")
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text("")
                
            }
            NavigationLink(destination:Favoritelist(),tag: 1,selection: $favactivitylink){}
            NavigationLink(destination:Login(),tag: 2,selection: $favactivitylink){}
            
            HStack{
                let shareactivity = selectedplace.activitytitle
                let shareprice = String(selectedplace.price)
                Button(action:{
                })
                {
                    ShareLink(item: "Activity Name: \(shareactivity)\nActivity Price: \(shareprice)") {
                        Text("SHARE")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(named: "button") ?? UIColor(Color.blue)))
                            .multilineTextAlignment(.center)
                            .padding(15)
                            .frame(maxWidth: 150)
                    }
                }
                .background(Color.blue)
                .cornerRadius(70)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.blue,lineWidth: 0)
                        .foregroundColor(.black)
                )
                
                Button(action:{
                    self.obj.mylist.append(selectedplace.activitytitle)
                    UserDefaults.standard.set(self.obj.mylist,forKey: "Fav_list")
                    self.favactivitylink = 1
                    
                })
                {
                    Text("FAVORITE")
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(named: "button") ?? UIColor(Color.blue)))
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .frame(maxWidth: 150)
                }
                .background(Color.blue)
                .cornerRadius(70)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.blue,lineWidth: 0)
                        .foregroundColor(.black)
                )
            }
        } //VStack ends
        .padding(10)
        .navigationBarItems(trailing: Button("Logout", action:{
            UserDefaults.standard.removeObject(forKey: "EMAIL")
            UserDefaults.standard.removeObject(forKey: "PASSWORD")
            UserDefaults.standard.removeObject(forKey: "ToggleState")
            UserDefaults.standard.removeObject(forKey: "Fav_list")
            self.favactivitylink = 2
        }))
        .onAppear(perform: {
            self.obj.mylist = UserDefaults.standard.array(forKey: "Fav_list") as? [String] ?? []
        })
        Spacer()
    }
    //    func sharefunction(){
    //        let shareactivity = selectedplace.activitytitle
    //        let shareprice = String(selectedplace.price)
    //        let sharedetails = " Activity Name: " + shareactivity + " Activity Price" + shareprice
    //        ShareLink(item: sharedetails)
    //    }
}

struct Activitydetails_Previews: PreviewProvider {
    static var previews: some View {
        Activitydetails(selectedplace: Activities())
    }
}
