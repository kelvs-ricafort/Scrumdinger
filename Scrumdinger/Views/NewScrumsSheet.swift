//
//  NewScrumsSheet.swift
//  Scrumdinger
//
//  Created by Kelvin on 5/27/23.
//

import SwiftUI

struct NewScrumsSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumsSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumsSheet(scrums: .constant(DailyScrum.sampleData),
            isPresentingNewScrumView: .constant(true))
    }
}
