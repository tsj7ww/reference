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


def BODY(data):
    """"""
    _hr = datetime.datetime.now().hour
    if _hr < 12:
        _header = 'Good Morning,<br><br>'
    elif (_hr >= 12) & (_hr < 5):
        _header = 'Good Afternoon,<br><br>'
    elif _hr > 5:
        _header = 'Good Evening,<br><br>'
    else:
        _header = 'Hello,<br><br>'
    _footer = '<br><br>Thanks,<br>{SENDER}'.format(SENDER=sender)
    _body = 'Here are today\'s job postings:<br><br>'
    _template = '<li><a href=\'{URL}\'>{TITLE} at {COMPANY} in {CITY}, {STATE}</li>'

    _groups = []
    [_groups.append((i['q_title'],i['q_location'])) for i in data if (i['q_title'],i['q_location']) not in _groups]
    for i in _groups:
        _row = '<b>{TTL} in {LOC}</b><br><ul>'.format(TTL=i[0],LOC=i[1])
        for j in data:
            if i==(j['q_title'],j['q_location']):
                _row+=_template.format(URL=j['url_post'],TITLE=j['title'],COMPANY=j['company'],CITY=j['city'],STATE=j['state'])
        _body+=(_row+'</ul>')
    return _body

def REPORT(content,fname,name,sender,stakeholders,server):
    """"""
    _body = 'Please review the file attached and reach out with questions.'
    _subject = 'File Attached: {}'.format(name)
    _cfg = {'Subject': _subject, 'From': owner, 'To': stakeholders}

    _msg = MIMEMultipart()
    for k,v in _cfg.items():
        _msg[k] = v
    _msg.attach(MIMEText(_body), subtype='plain')

    _a = MIMEApplication(content,Name=fname)
    _a['Content-Disposition'] = 'attachment; filename={}'.format(fname)
    _msg.attach(_a)

    with smtplib.SMTP(server) as s:
        s.send_message(_msg)

def ALERT(body,name,sender,recipients,server,port,pwd,success=False):
    """
    local host server email
    """
    if success:
        _msg = {
            'Subject': 'Successful Run: '+name
            ,'From': sender
            ,'To': recipients
        }
    else:
        _msg = {
            'Subject': 'Job Failure: '+name
            ,'From': sender
            ,'To': sender
        }
    msg = EmailMessage()
    for i,j in _msg.items():
        msg[i] = j
    msg.set_content(body,subtype='plain')

    with smtplib.SMTP(server,port) as s:
        s.send_message(msg)
