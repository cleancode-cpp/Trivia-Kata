import qbs

Project {
    minimumQbsVersion: "1.7.1"

    references: [
        "thirdparty",
    ]

    StaticLibrary {
        name: "trivia"
        Depends { name: "cpp" }

        files: [
            "Game.cc",
            "Game.h",
        ]

        Export {
            Depends { name: "cpp" }
        }
    }

    Application {
        name: "trivia_tests"
        Depends { name: "trivia" }
        consoleApplication: true
        Depends { name: "googletest" }

        files: [
            "TriviaUnitTests.cc",
        ]
    }

    Application {
        name: "trivia_app"
        consoleApplication: true
        Depends { name: "trivia" }
        files: [
            "TriviaTextTests.cc",
        ]
    }
}
