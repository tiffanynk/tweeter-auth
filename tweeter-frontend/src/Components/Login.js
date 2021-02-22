import React from 'react'

export default function Login() {
    return (
        <div>
            <form id='login-form'>
                <h1>Tweeter</h1>
                <label>Username</label>
                <input name='username'/>
                <label>Password</label>
                <input type='password' name='password'/>
                <input type='submit' value='Login'/>
            </form>
        </div>
    )
}
