# email
import smtplib
from email.message import EmailMessage
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

class Ping:
    def __init__(self,subject,sender,recipients,server,body=None,files=None):
        self.subject = subject
        self.sender = sender
        self.recipients = recipients
        self.server = server
        self.body = body
        self.files = files
        self.msg = _make(self)

    def _make(self):
        p = {
            'Subject': self.subject,
            'From': self.sender,
            'To': self.recipients
        }
        if self.files:
            try:
                m = MIMEMultipart()
            except:
                raise
            try:
                for i,_ in enumerate(files):
                    a = MIMEApplication(_['content'],Name=_['fname'])
                    a['Content-Disposition'] = 'attachment; filename={}'.format(_['fname'])
                    m.attach(a)
            except Exception as e:
                raise Exception('Error on processing file {}: {}'.format((i+1), str(e)))
        else:
            try:
                m = EmailMessage()
            except:
                raise
        if self.body:
            try:
                m.attach(MIMEText(self.body['content']), subtype=self.body['type'])
            except Exception as e:
                raise Exception('Body unable to be attached: {}'.format(str(e)))
        for i,j in p.items():
            try:
                m[i] = j
            except Exception as e:
                raise Exception('Unable to set parameter {} on message: {}'.format(i,str(e)))
        return m

    def send(self):
        try:
            with smtplib.SMTP(self.server) as s:
                s.send_message(self.msg)
        except Exception as e:
            raise Exception('Unable to send message: {}'.format(str(e)))


def HI_BYE(name):
    """"""
    hr = datetime.datetime.now().hour
    if hr < 12:
        header = 'Good Morning,<br><br>'
    elif (hr >= 12) & (hr < 5):
        header = 'Good Afternoon,<br><br>'
    elif hr > 5:
        header = 'Good Evening,<br><br>'
    else:
        header = 'Hello,<br><br>'
    footer = '<br><br>Thanks,<br>{SENDER}'.format(SENDER=name)
    body = ''

    return (header+'{BODY}'+footer)

def BODY(data):
    """"""
    body = ''
    template = '{}'
    
    for d in data:
        body+=template.format(d)

    return body

def REPORT(files,name,sender,stakeholders,server):
    """
    files = [(string content,fname)]
    """
    body = 'Please review the file attached and reach out with questions.'
    subject = 'File Attached: {}'.format(name)
    cfg = {'Subject': subject, 'From': owner, 'To': stakeholders}

    msg = MIMEMultipart()
    for k,v in cfg.items():
        msg[k] = v
    msg.attach(MIMEText(body), subtype='plain')

    for file in files:
        attach = MIMEApplication(file[0],Name=file[1])
        attach['Content-Disposition'] = 'attachment; filename={}'.format(file[1])
        msg.attach(attach)

    with smtplib.SMTP(server) as svr:
        svr.send_message(msg)

def ALERT(name,sender,recipients,server,success=False,body=None):
    """"""
    cfg = {'From': sender, 'To': recipients}
    subject = 'Job {}: {}'
    if success:
        msg['Subject'] = subject.format('Success', name)
    else:
        msg['Subject'] = subject.format('Failure', name)

    msg = EmailMessage()
    for k,v in cfg.items():
        msg[k] = v
    if body:
        msg.set_content(body,subtype='plain')

    with smtplib.SMTP(server,port) as svr:
        svr.send_message(msg)
