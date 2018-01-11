#include "Game.h"
#include <stdlib.h>

using namespace std;

int main()
{
    Game aGame;

    aGame.add("Chet");
    aGame.add("Pat");
    aGame.add("Sue");

    list<int> rolls = {1, 2, 5, 2, 5, 5, 4, 5, 2, 1, 2, 2, 5, 5, 4, 5, 3};
    list<int> answers = {7, 0, 0, 6, 6, 8, 5, 3, 8, 7, 4, 3, 8, 3, 8, 7, 5};

    bool notAWinner = true;
    do {
        aGame.roll(rolls.front());
        rolls.pop_front();
        notAWinner = (answers.front() == 7 ? aGame.wrongAnswer() : aGame.wasCorrectlyAnswered());
        answers.pop_front();
    } while (notAWinner && (! rolls.empty()) && (! answers.empty()));
}
