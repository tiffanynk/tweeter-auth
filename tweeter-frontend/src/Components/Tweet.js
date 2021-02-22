import React from 'react'

export default function Tweet() {
    return (
        <section class="new-tweet">
            <div class="left">
                <img src="https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png"/>
            </div>
            <div class="right">
                <textarea type="text" placeholder="What's happening?" id="tweet"></textarea>
                <button>Tweet</button>
            </div>
        </section>
    )
}
