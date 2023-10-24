import SwiftUI

struct Subject: Identifiable {
    var id = UUID()
    var name: String
    var grades: [Grade]
}

struct Grade: Identifiable {
    var id = UUID()
    var value: Int
    var comment: String
}

struct EvaluationView: View {
    let subjects: [Subject] = [
        Subject(name: "Math", grades: [Grade(value: 95, comment: "Excellent work!"), Grade(value: 88, comment: "Keep it up!")]),
        Subject(name: "Science", grades: [Grade(value: 92, comment: "Great job!"), Grade(value: 75, comment: "Room for improvement.")]),
        Subject(name: "Personal Finance", grades: [Grade(value: 80, comment: "Good progress!"), Grade(value: 93, comment: "Outstanding!")]),
        Subject(name: "Physics", grades: [Grade(value: 88, comment: "Well done!"), Grade(value: 90, comment: "Impressive!")]),
        Subject(name: "Physical Training", grades: [Grade(value: 95, comment: "Keep up the good work!"), Grade(value: 78, comment: "Improvement needed.")]),
        Subject(name: "Chemistry", grades: [Grade(value: 85, comment: "Making progress!"), Grade(value: 92, comment: "Excellence!")]),
        Subject(name: "Biology", grades: [Grade(value: 90, comment: "Excellent performance!"), Grade(value: 86, comment: "Good effort!")])
    ]


    var body: some View {
        NavigationView {
            List(subjects) { subject in
                NavigationLink(destination: GradeListView(grades: subject.grades)) {
                    Text(subject.name)
                }
            }
            .navigationTitle("Subjects")
        }
    }
}

struct GradeListView: View {
    let grades: [Grade]

    var body: some View {
        List(grades) { grade in
            NavigationLink(destination: GradeDetailView(grade: grade)) {
                Text("Grade: \(grade.value)")
            }
        }
        .navigationTitle("Grades")
    }
}

struct GradeDetailView: View {
    let grade: Grade

    var body: some View {
        VStack {
            Text("Grade: \(grade.value)")
                .font(.largeTitle)
            Text("Comment: \(grade.comment)")
                .padding()
        }
        .navigationTitle("Grade Detail")
    }
}

struct EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationView()
    }
}
