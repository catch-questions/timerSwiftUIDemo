//
//  ContentView.swift
//  timerSwiftUIDemo
//
//  Created by os on 2019/12/11.
//  Copyright © 2019 Catch Questions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var toDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
    var body: some View {
        
        VStack {
            
            Text("Countdown for Retirement")
            
            Spacer().frame(height:50)
            
            TimerView(setDate: toDate)
        
        }.font(.system(size:30))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TimerView : View {
    
    @State var nowDate: Date = Date()
    let setDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        Text(TimerFunction(from: setDate))
            .onAppear(perform: {self.timer
            })
    }

    func TimerFunction(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar
            .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
        return String(format: "%02d days remaining - %02d:%02d:%02d",
                      timeValue.day!,
                      timeValue.hour!,
                      timeValue.minute!,
                      timeValue.second!)
    }

}
