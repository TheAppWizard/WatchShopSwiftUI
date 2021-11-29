//
//  ContentView.swift
//  WatchShopSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 27/11/21.
//  TheAppWizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
       ShopUI()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ShopUI: View {
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                Header()
                Spacer()
                WatchBody()
                    .offset(x: 0, y: 20)
                Spacer()
                ShopOptions()
            }
        }
    }
}


   

struct Header: View {
    var body: some View {
        HStack{
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
            
            Spacer()
                .frame(width: 30, height: 0)
               
            
            Image(systemName: "envelope")
                .resizable()
                .frame(width: 30, height: 23)
                .foregroundColor(.black)
        }.padding(15)
    }
}


struct WatchBody: View {
    @State private var redWatch = false
    @State private var redWatchAnim = false
    @State private var blueWatch = false
    @State private var blueWatchAnim = false
    @State private var blackWatch = false
    @State private var blackWatchAnim = false
    
    var body: some View {
       
        HStack
        {
             
            ZStack{
                Image("white")
                    .resizable()
                    .frame(width: 400, height: 400)
                
                if redWatch{
                    Image("red")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .opacity(redWatchAnim ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).repeatCount(1))
                                       .onAppear()
                                   {
                                       self.redWatchAnim.toggle()
                                   }
                     
               }
                
                if blueWatch{
                    Image("blue")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .opacity(blueWatchAnim ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).repeatCount(1))
                                       .onAppear()
                                   {
                                       self.blueWatchAnim.toggle()
                                   }
               }
                
                if blackWatch{
                    Image("black")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .opacity(blackWatchAnim ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).repeatCount(1))
                                       .onAppear()
                                   {
                                       self.blackWatchAnim.toggle()
                                   }
               }
            }
            
            
            VStack{
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                    .gesture(
                        TapGesture()
                            .onEnded({
                                self.redWatch.toggle()
                            })
                    
                    )
                
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                    .gesture(
                        TapGesture()
                            .onEnded({
                                self.blueWatch.toggle()
                            })
                    
                    )
                
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                    .gesture(
                        TapGesture()
                            .onEnded({
                                self.blackWatch.toggle()
                            })
                    
                    )
                
           
            
            }.offset(x: -20, y: 0)
            
        }
    }
}


struct ShopOptions: View {
    
    
    @State private var heartTap = false
    
    let para = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tincidunt et metus mattis auctor."
  
    var body: some View {
        ZStack{
            
            
          
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 430, height: 350)
                .offset(x: 0, y: 55)
                .foregroundColor(.black)
            
            
            VStack{
                
                HStack{
                Text("Apple Watch")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: 90)
                    
                    
                    Spacer()
                    
                    ZStack{
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(.white)
                        .gesture(
                            TapGesture()
                                .onEnded({
                                    self.heartTap.toggle()
                                })
                        
                        )
                        
                        if heartTap {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 28)
                                .foregroundColor(.red)
                        }
                        
                    }
                        .offset(x: 0, y: 90)
                
                
                
                }.padding(21)
               
                Spacer()
                Text(para)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(.white.opacity(1))
                    .padding()
                    .offset(x: 0, y: 25)
                
                Spacer()
                ButtonV()
                    .offset(x: 20, y: 20)
            }.padding()
        }
    }
}


struct ButtonV: View {
    
    @State private var arrowAnim = false
    
    var body: some View {
        ZStack{
           

                
            HStack{
            Text("350 $")
                .font(.system(size: 30))
                .fontWeight(.thin)
                .foregroundColor(.white)
                
                
                
             Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .foregroundColor(.white)
                    .opacity(arrowAnim ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                                   .onAppear()
                               {
                                   self.arrowAnim.toggle()
                               }
                
                   
                
            }
               
                
        }.offset(x: 105, y: -40)
    }
}
