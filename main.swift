//местами перепутаны A и B, в целом распознает и работает очень очень хорошО!

func extractMessagesFromPersonB(rects: [CGRect], messages: [String]) -> [String] {
        var messagesB = [String]()
        var messagesA = [String]() //это я дописал
        var messages_arr = [String]() //это я тож дописал
        
        var lastY: CGFloat = 0
        for i in 0..<rects.count {
            let rect = rects[i]
            let message = messages[i]
            let x = rect.origin.x + rect.size.width / 2 // middle X position of the rectangle
            let y = rect.origin.y
            if y > lastY { // new message line, assume it's from person B
                messagesB.append(message)
                messages_arr.append("B: "+message) //akim
            } else if x < 0.5 { // person A message, skip
                messagesA.append(message)
                messages_arr.append("A: "+message) //akim
                continue
            } else { // same line as previous message, assume it's from person B
                messagesB[messagesB.count - 1] += " " + message
                messages_arr.append("B: "+message) //akim
            }
            lastY = y
        }
        return messages_arr
    }
    
    
