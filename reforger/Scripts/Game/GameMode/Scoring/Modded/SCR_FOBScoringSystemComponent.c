class ScoreSystem
{
    private ref map<string, int> scores;
    private ref map<string, ref map<string, int>> boxScores;

    void ScoreSystem()
    {
        scores = new map<string, int>();
        boxScores = new map<string, ref map<string, int>>();
    }

    void AddScore(string side, int amount)
    {
        if (!scores.Contains(side))
        {
            scores.Insert(side, 0);
        }
        scores.Set(side, scores.Get(side) + amount);
    }

    void AddBoxScore(string boxId, string side, int amount)
    {
        if (!boxScores.Contains(boxId))
        {
            boxScores.Insert(boxId, new map<string, int>());
        }

        ref map<string, int> box;
        if (!boxScores.Get(boxId))
        {
            box = new map<string, int>();
            boxScores.Set(boxId, box);
        }
        else
        {
            box = boxScores.Get(boxId);
        }

        if (!box.Contains(side))
        {
            box.Insert(side, 0);
        }
        box.Set(side, box.Get(side) + amount);
    }

    int GetScore(string side)
    {
        if (scores.Contains(side))
        {
            return scores.Get(side);
        }
        return 0;
    }

    int GetBoxScore(string boxId, string side)
    {
        if (boxScores.Contains(boxId) && boxScores.Get(boxId).Contains(side))
        {
            return boxScores.Get(boxId).Get(side);
        }
        return 0;
    }
}