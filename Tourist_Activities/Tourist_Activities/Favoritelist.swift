

import SwiftUI

struct Favoritelist: View {
    
    @EnvironmentObject var obj : AppData
    var singleton = Singleton()
    @State private var logoutlink:Int? = nil
    @State private var removelink:Int? = nil
    @State private var show = false
    @State private var tmplist:[Activities] = [Activities]()
    var body: some View {
        VStack {
            NavigationLink(destination:Login(),tag: 1,selection: $logoutlink){}
            NavigationLink(destination:ContentView(),tag: 1,selection: $removelink){}
            Text("Favorite Activities")
                .foregroundColor(Color(UIColor(named: "titlecolor") ?? UIColor(Color.blue)))
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            if(self.obj.mylist.isEmpty){
                Text("There is no activties in Favotite List")
                    .frame(maxWidth: .infinity,alignment: .center)
                Spacer()
            }
            else{
                List{
                    Section(){
                        ForEach(self.tmplist){ place in
                            HStack{
                                Image(place.image)
                                    .resizable()
                                    .frame(width: 80)
                                    .frame(height: 70)
                                    .border(.blue)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("\(place.activitytitle)")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(Color(UIColor(named: "fontcolor") ?? UIColor(Color.blue)))
                                    
                                    Text("")
                                    
                                    Text("Price: $\(place.price) per person")
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            self.tmplist.remove(atOffsets: indexSet)
                            UserDefaults.standard.set(obj.mylist, forKey: "Fav_list")
                            print(indexSet)
                            
                        })
                    }
                }
            }
        }
        Button(action:{
            
            //self.removelink = 1
            self.show = true
            
        })
        {
            Text("Delete")
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
        .alert(isPresented: self.$show) {
            Alert(
                title: Text("Are you sure you want to delete list?"),
                primaryButton: .destructive(Text("Delete")) {
                    UserDefaults.standard.removeObject(forKey: "Fav_list")
                    self.removelink = 1
                },
                secondaryButton: .cancel()
                
            )
        }
        .onAppear{
            //            self.obj.mylist = UserDefaults.standard.array(forKey: "Fav_list") as? [String] ?? []
            for i in UserDefaults.standard.array(forKey: "Fav_list") as? [String] ?? []{
                for j in singleton.places{
                    if(i == j.activitytitle){
                        self.tmplist.append(j)
                    }
                }
            }
            
        }
        .navigationBarItems(trailing: Button("Logout", action:{
            UserDefaults.standard.removeObject(forKey: "EMAIL")
            UserDefaults.standard.removeObject(forKey: "PASSWORD")
            UserDefaults.standard.removeObject(forKey: "ToggleState")
            UserDefaults.standard.removeObject(forKey: "Fav_list")
            self.logoutlink = 1
        }))
    }
}

struct Favoritelist_Previews: PreviewProvider {
    static var previews: some View {
        Favoritelist()
    }
}

