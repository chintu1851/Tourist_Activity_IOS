

import SwiftUI

struct ContentView: View {
    
    var singleton = Singleton()
    @State private var favactivitylink:Int? = nil
    
    var body: some View {
        
        VStack {
            Text("Things to do in Mumbai")
                .foregroundColor(Color(UIColor(named: "titlecolor") ?? UIColor(Color.blue)))
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            List{
                ForEach(singleton.places) { currentactivity in
                    NavigationLink(destination: Activitydetails(selectedplace:currentactivity )){
                        HStack{
                            Image(currentactivity.image)
                                .resizable()
                                .frame(width: 80)
                                .frame(height: 70)
                                .border(.blue)
                            VStack(alignment: .leading){
                                
                                Text("\(currentactivity.activitytitle)")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(UIColor(named: "fontcolor") ?? UIColor(Color.blue)))
                                Text("")
                                Text("Price: $\(currentactivity.price) per person")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                    .bold()
                                
                            }//VStack ends
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            
            NavigationLink(destination:Favoritelist(),tag: 1, selection: $favactivitylink){}
            NavigationLink(destination:Login(),tag: 2, selection: $favactivitylink){}
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Menu{
                            
                            Button("Favourite", action:{
                                self.favactivitylink = 1
                            })
                            Button("Logout", action:{
                                UserDefaults.standard.removeObject(forKey: "EMAIL")
                                UserDefaults.standard.removeObject(forKey: "PASSWORD")
                                UserDefaults.standard.removeObject(forKey: "ToggleState")
                                UserDefaults.standard.removeObject(forKey: "Fav_list")
                                self.favactivitylink = 2
                            })
                            
                        }label: {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 20)
                                .frame(height: 20)
                                .padding(10)
                        }
                    }
                }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
