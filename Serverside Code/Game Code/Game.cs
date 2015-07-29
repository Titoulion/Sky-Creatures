using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using PlayerIO.GameLibrary;
using System.Drawing;

namespace SkyCreatures {
	public class Player : BasePlayer {
	}

    [RoomType("SkyCreatures")]
    public class GameCode : Game<Player>
    {
        // This method is called when an instance of your the game is created
        public override void GameStarted()
        {
            // anything you write to the Console will show up in the 
            // output window of the development server
            Console.WriteLine("Started: " + RoomId);
        }

        // This method is called when the last player leaves the room, and it's closed down.
        public override void GameClosed()
        {
            Console.WriteLine("Closed: " + RoomId);
        }

        // This method is called whenever a player joins the game
        public override void UserJoined(Player player)
        {
            Console.WriteLine("Joined: " + player.ConnectUserId);
        }

        // This method is called when a player leaves the game
        public override void UserLeft(Player player)
        {
            Console.WriteLine("Left: " + player.ConnectUserId);
        }

        // This method is called when a player sends a message into the server code
        public override void GotMessage(Player player, Message message)
        {
            foreach (var p in Players)
            {
                if (p != player)
                {
                    p.Send(message);
                }
            }
        }
    }
}